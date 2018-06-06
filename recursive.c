#define _CRT_SECURE_NO_WARNINGS
#include "sqlite3.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static int callback(void *data, int argc, char **argv, char **column_name) {
	for (unsigned int i = 0; i < argc; i++) {
		printf("%s = %s\n", column_name[i], argv[i] ? argv[i] : "NULL");
	}
	return 0;
}

int main() {
	sqlite3 * db;
	int check, top, k;
	char * sql; //буфер, куда пишем sql скрипт
	char * error_messege;
	const char* data = "";
	char  top_c[4];
	char k_c[4];
	

	check = sqlite3_open("test.db", &db);
	if (check) {
		fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
	}
	else fprintf(stdout, "Opened successfully\n");

	sql = "CREATE TABLE t(" \
		"id int NOT NULL,"\
		"parent_id int NOT NULL"\
		"); ";
	check = sqlite3_exec(db, sql, callback, 0, &error_messege);
	if (check != SQLITE_OK) {
		fprintf(stderr, "SQL error: %s\n", error_messege);
		sqlite3_free(error_messege);
	}
	else {
		fprintf(stdout, "Table created successfully\n");
	}

	sql = "INSERT INTO t VALUES (1, 0); "\
		"INSERT INTO t VALUES(2, 1); "\
		"INSERT INTO t VALUES(3, 1);"\
		"INSERT INTO t VALUES(4, 1); "\
		"INSERT INTO t VALUES(5, 1);"\
		"INSERT INTO t VALUES(6, 1); "\
		"INSERT INTO t VALUES(7, 2);"\
		"INSERT INTO t VALUES(8, 2); "\
		"INSERT INTO t VALUES(9, 3);"\
		"INSERT INTO t VALUES(10, 4); "\
		"INSERT INTO t VALUES(11, 5);"\
		"INSERT INTO t VALUES(12, 6); "\
		"INSERT INTO t VALUES(13, 6);"\
		"INSERT INTO t VALUES(14, 5); "\
		"INSERT INTO t VALUES(15, 14); " \
		"INSERT INTO t VALUES(9, 8);"\
		"INSERT INTO t VALUES(3, 4);"\
		"INSERT INTO t VALUES(3, 10);"\
		"INSERT INTO t VALUES(4, 15);";
	check = sqlite3_exec(db, sql, callback, 0, &error_messege);
	if (check != SQLITE_OK) {
		fprintf(stderr, "SQL error: %s\n", error_messege);
		sqlite3_free(error_messege);
	}
	else {
		fprintf(stdout, "Inserted successfully\n");
	}

	printf("Fill data\nTop number: ");
	scanf("%d", &top);
	printf("Steps: ");
	scanf("%d", &k);

	_itoa(top, top_c, 10);
	_itoa(k, k_c, 10);

	char buf[1024];
	strcpy(buf, "WITH r (id, parent_id, lvl) AS( "\
		"SELECT id, parent_id, 1 AS lvl "\
		"FROM t WHERE parent_id = ");
	strcat(buf, top_c);
	strcat(buf, "\nUNION ALL "\
						"SELECT t.id, t.parent_id, r.lvl + 1 "\
						"FROM t "\
						"INNER JOIN r "\
						"ON t.parent_id = r.id "\
						") "\
						"SELECT DISTINCT id "\
						"FROM r "\
						"WHERE lvl = ");
	strcat(buf, k_c);
	strcat(buf, ";\n");
	
	printf("Tops that you can reach in %d steps, moving from top %d:\n", k, top);
	check = sqlite3_exec(db, buf, callback, (void*)data, &error_messege);
	if (check != SQLITE_OK) {
		fprintf(stderr, "SQL error: %s\n", error_messege);
		sqlite3_free(error_messege);
	}
	else {
		fprintf(stdout, "Done successfully\n");
	}



	sql = "DROP TABLE t";
	check = sqlite3_exec(db, sql, callback, 0, &error_messege);
	if (check != SQLITE_OK) {
		fprintf(stderr, "SQL error: %s\n", error_messege);
		sqlite3_free(error_messege);
	}
	else {
		fprintf(stdout, "Table dropped successfully\n");
	}
	sqlite3_close(db);
	return 0;
}