-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD grpc_url VARCHAR(255) DEFAULT NULL,
    ADD grpc_protobuf TEXT,
    ADD grpc_body TEXT,
    ADD grpc_metadata TEXT,
    ADD grpc_method VARCHAR(255) DEFAULT NULL,
    ADD grpc_service_name VARCHAR(255) DEFAULT NULL,
    ADD grpc_enable_tls BOOLEAN DEFAULT 0 NOT NULL;
