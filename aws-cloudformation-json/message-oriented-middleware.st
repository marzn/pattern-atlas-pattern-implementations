"AmazonMQBroker$random$": {
    "Type": "AWS::AmazonMQ::Broker",
    "Properties": {
        "AutoMinorVersionUpgrade": false,
        "BrokerName": "ActiveMQ-Broker-$random$",
        "Configuration": {
            "Id": {
                "Ref": "AmazonMQConfiguration$random$"
            },
            "Revision": {
                "Fn::GetAtt": [
                    "AmazonMQConfiguration$random$",
                    "Revision"
                ]
            }
        },
        "DeploymentMode": "SINGLE_INSTANCE",
        "EngineType": "ACTIVEMQ",
        "EngineVersion": "5.15.0",
        "HostInstanceType": "mq.t2.micro",
        "PubliclyAccessible": false,
        "Users": [{
            "Username": "test",
            "Passwort": "TODO: Change me!"
        }]
    }
},
"AmazonMQConfiguration$random$": {
    "Type": "AWS::AmazonMQ::Configuration",
    "Properties": {
        "Data": {
            "Fn::Base64": "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <beans xmlns=\"http://www.springframework.org/schema/beans\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://activemq.apache.org/schema/core http://activemq.apache.org/schema/core/activemq-core.xsd\"> <bean class=\"org.springframework.beans.factory.config.PropertyPlaceholderConfigurer\"> <property name=\"locations\"> <value>file:\${activemq.conf}/credentials.properties</value> </property> </bean> <bean id=\"logQuery\" class=\"io.fabric8.insight.log.log4j.Log4jLogQuery\" lazy-init=\"false\" scope=\"singleton\" init-method=\"start\" destroy-method=\"stop\"> </bean> <broker xmlns=\"http://activemq.apache.org/schema/core\" brokerName=\"localhost\" dataDirectory=\"\${activemq.data}\"> <destinationPolicy> <policyMap> <policyEntries> <policyEntry topic=\">\" > <pendingMessageLimitStrategy> <constantPendingMessageLimitStrategy limit=\"1000\"/> </pendingMessageLimitStrategy> </policyEntry> </policyEntries> </policyMap> </destinationPolicy> <managementContext> <managementContext createConnector=\"false\"/> </managementContext> <persistenceAdapter> <kahaDB directory=\"\${activemq.data}/kahadb\"/> </persistenceAdapter> <systemUsage> <systemUsage> <memoryUsage> <memoryUsage percentOfJvmHeap=\"70\" /> </memoryUsage> <storeUsage> <storeUsage limit=\"100 gb\"/> </storeUsage> <tempUsage> <tempUsage limit=\"50 gb\"/> </tempUsage> </systemUsage> </systemUsage> <transportConnectors> <transportConnector name=\"openwire\" uri=\"tcp://0.0.0.0:61616?maximumConnections=1000&amp;wireFormat.maxFrameSize=104857600\"/> <transportConnector name=\"amqp\" uri=\"amqp://0.0.0.0:5672?maximumConnections=1000&amp;wireFormat.maxFrameSize=104857600\"/> <transportConnector name=\"stomp\" uri=\"stomp://0.0.0.0:61613?maximumConnections=1000&amp;wireFormat.maxFrameSize=104857600\"/> <transportConnector name=\"mqtt\" uri=\"mqtt://0.0.0.0:1883?maximumConnections=1000&amp;wireFormat.maxFrameSize=104857600\"/> <transportConnector name=\"ws\" uri=\"ws://0.0.0.0:61614?maximumConnections=1000&amp;wireFormat.maxFrameSize=104857600\"/> </transportConnectors> <shutdownHooks> <bean xmlns=\"http://www.springframework.org/schema/beans\" class=\"org.apache.activemq.hooks.SpringContextHook\" /> </shutdownHooks> </broker> <camelContext>$configuration$</camelContext> </beans>"
        },
        "EngineType": "ACTIVEMQ",
        "EngineVersion": "5.15.0",
        "BrokerName": "ActiveMQ-Config-$random$"
    }
}
