from os import getenv
from neo4j.v1 import GraphDatabase
user_id = getenv("NEO4J_USER")
password = getenv("NEO4J_PSWD")
uri = getenv("NEO4J_URI")
driver = GraphDatabase.driver(uri, auth=(user_id, password ))
with driver.session() as sess:
        sess.run(
                "MERGE (a1:Hospital{provider_id:50108}) "
                "        SET a1.hospital_name = 'SUTTER MEDICAL CENTER, SACRAMENTO'"
                "MERGE (a2:Hospital{provider_id:51328 }) "
                "        SET a2.hospital_name = 'TAHOE FOREST HOSPITAL'"
                "MERGE (a3:Hospital{provider_id: 130006 }) "
                "        SET a3.hospital_name = 'ST LUKES REGIONAL MEDICAL CENTER'"
                "MERGE (t1:Hospital_Type{name:'Acute Care Hospitals'}) "
                "MERGE (t2:Hospital_Type{name:'Critical Access Hospitals'}) "
                "MERGE (a1)-[:ISA]->(t1) "
                "MERGE (a2)-[:ISA]->(t2) "
                "MERGE (a3)-[:ISA]->(t1) "
                 )


with driver.session() as sess:
       results =  sess.run(
                "MATCH (hosp:Hospital) WHERE hosp.provider_id = {pid} return hosp.hospital_name, hosp.provider_id",
                {"pid":50108}
        )
print(results.data())
