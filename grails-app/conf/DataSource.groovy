dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }
 production {
            dataSource {
                pooled = true
                dbCreate = "update"
                url = "jdbc:mysql://localhost:3307/[username]?autoReconnect=true"
                driverClassName = "com.mysql.jdbc.Driver"
                dialect = org.hibernate.dialect.MySQL5InnoDBDialect
                username = "[username]"
                password = "[password]"
                properties {
                    maxActive = 10
                    maxIdle = 5
                    minIdle = 2
                    initialSize = 2
                    minEvictableIdleTimeMillis = 60000
                    timeBetweenEvictionRunsMillis = 60000
                    maxWait = 10000
                    validationQuery = "/* ping */"
                }
            }
    }}
