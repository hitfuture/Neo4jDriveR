if(Sys.getenv("NEO4J_URI") == "") Sys.setenv("NEO4J_URI" = "bolt://localhost:7687")
if(Sys.getenv("NEO4J_USER") == "") Sys.setenv("NEO4J_USER" = "neo4j")
if(Sys.getenv("NEO4J_PSWD") == "") Sys.setenv("NEO4J_PSWD" = "neo4j")

print("setup_config.R is executing")
