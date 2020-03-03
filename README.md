# Description

This image contain the liquibase tool. This tool can help you import the data (from xmls) in to [apache derby](https://db.apache.org/derby/) db.

# Variables

**LIQUIBASE_CHANGELOGFILE** - path to liquibase changelog.xml   
**DB_HOST** - URL or IP of derby server   
**DB_PORT** - derby server port  
**DB_DB** - name of derby db    
**DB_USER** - name of db user   
**DB_PASS** - password of MARIADB_USER  
**LIQUIBASE_DEFAULTSCHEMA** - name of schama  

# Volumes
The workingdir ist "/workspace", so you need to mount you liqubiase xml files into this folder.

# Run
sudo docker run --rm -v /vagrant/basic/.liquibase/Data_alias/:/workspace -e LIQUIBASE_CHANGELOGFILE=changelog.xml -e DB_HOST=mariadbhost -e DB_DB=test -e DB_PORT=3306 -e DB_USER=root -e DB_PASS=jFALkmf -it liq update
```