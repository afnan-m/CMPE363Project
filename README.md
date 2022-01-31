# CMPE363Project
This is a simple webapp embedded with chatbot project that aims to demonstrate how cloud services are useful in real-life problems
This project is based on Azure cloud services. 

1) resourceAutomation file is used to create the necessary resources:
- Resource group, 
- Webapp and its server,
- SQL Server, firewall rules, and database 
- Connection for webapp and databse

2) create_fill_table_Query file includes a script to create an empty table on the SQL database as well as an insert script. This script was executed using the query editor on the database inside the Azure portal.

3) table_view_query file includes a single line code to be executed in the query editor to view the entries table.

4) QAfinalDatabse and friendlypersona files were used to create the knowledge base and the chit-chat personality of the chat bot using QnA maker from Azure services.

5) chatBot_code file includes the embedded source code of the chatbot.

6) websiteSourceCode file includes the html source code to create the website and it was created using Visual Studio then published to the Azure webapp.

Additionally, a load balancer and virtual machines along with the required Virtual Network,  Public IP, NAT Gateway, Network Security Group, and other necessary resources were created using Azure portal interface.
