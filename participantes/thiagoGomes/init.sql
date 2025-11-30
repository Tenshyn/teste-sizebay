CREATE TABLE IF NOT EXISTS client (
    id INT PRIMARY KEY,
    client_limit INT NOT NULL,
    balance INT NOT NULL
);

INSERT INTO client (id, client_limit, balance) VALUES (1, 100000, 0);
INSERT INTO client (id, client_limit, balance) VALUES (2, 80000, 0);
INSERT INTO client (id, client_limit, balance) VALUES (3, 1000000, 0);
INSERT INTO client (id, client_limit, balance) VALUES (4, 10000000, 0);
INSERT INTO client (id, client_limit, balance) VALUES (5, 500000, 0);

CREATE TABLE IF NOT EXISTS transaction (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    value INT NOT NULL,
    type INT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(10),
    client_id INT NOT NULL,
    CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE INDEX idx_transaction_client_id ON transaction(client_id);
CREATE INDEX idx_transaction_created_at ON transaction(created_at DESC);
