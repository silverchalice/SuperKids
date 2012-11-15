dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "sks"
    password = "sks5551212"

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://173.255.205.141:3306/sksdb"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/sks"
        }
    }
    production {
        dataSource {
			pooled = true
   		    driverClassName = "com.mysql.jdbc.Driver"
			username = "sks"
			password = "sks5551212"
			dbCreate = "update"			
            url = "jdbc:mysql://173.255.205.141:3306/sksdb"
            autoReconnect=true

        }
    }
}

