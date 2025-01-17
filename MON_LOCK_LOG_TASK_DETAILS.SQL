SELECT "LOCK"."APPLICATION_ID" AS "APPLICATION",
	"LOCK"."SPACE_ID" AS "SPACE",
	"LOCK"."OBJECT_ID" AS "OBJECT",
	"LOCK"."TASK_LOG_ID" AS "LOCK_TASK_ID",
	"LOCK"."CREATION_TIME" AS "LOCK_CREATION_TIME",
	"LOGS"."TASK_LOG_ID" AS "LOG_TASK_ID",
	"LOGS"."START_TIME" AS "LOG_START_TIME",
	"MSG"."MESSAGE_NO" AS "_LOG_MESSAGE_NO",
	"MSG"."SEVERITY" AS "MSG_SEVERITY",
	"MSG"."TEXT" AS "MSG_TEXT",
	"MSG"."DETAILS" AS "MSG_DETAILS",
	1 AS "COUNTER"
FROM "TASK_LOCKS_V_EXT" AS "LOCK"
	LEFT OUTER JOIN "TASK_LOGS_V_EXT" AS "LOGS" ON "LOCK"."TASK_LOG_ID" = "LOGS"."TASK_LOG_ID"
	LEFT OUTER JOIN "TASK_LOG_MESSAGES_V_EXT" AS "MSG" ON "LOCK"."TASK_LOG_ID" = "MSG"."TASK_LOG_ID"
GROUP BY "LOCK"."APPLICATION_ID",
	"LOCK"."SPACE_ID",
	"LOCK"."OBJECT_ID",
	"LOCK"."TASK_LOG_ID",
	"LOCK"."CREATION_TIME",
	"LOGS"."TASK_LOG_ID",
	"LOGS"."START_TIME",
	"MSG"."MESSAGE_NO",
	"MSG"."SEVERITY",
	"MSG"."TEXT",
	"MSG"."DETAILS"
ORDER BY "LOCK"."APPLICATION_ID",
	"LOCK"."SPACE_ID",
	"LOCK"."OBJECT_ID",
	"LOCK"."TASK_LOG_ID",
	"LOCK"."CREATION_TIME",
	"LOGS"."TASK_LOG_ID",
	"LOGS"."START_TIME",
	"MSG"."MESSAGE_NO",
	"MSG"."SEVERITY",
	"MSG"."TEXT",
	"MSG"."DETAILS"
