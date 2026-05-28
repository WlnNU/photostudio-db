CREATE TABLE client (
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    phone      VARCHAR(20),
    email      VARCHAR(100) UNIQUE,
    birth_date DATE
);

CREATE TABLE photographer (
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    phone          VARCHAR(20),
    specialization VARCHAR(100),
    rate_per_hour  DECIMAL(10, 2) NOT NULL DEFAULT 0
);

CREATE TABLE shoot_type (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    base_price  DECIMAL(10, 2) NOT NULL DEFAULT 0
);

CREATE TABLE studio (
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    address        VARCHAR(255),
    capacity       INT,
    price_per_hour DECIMAL(10, 2) NOT NULL DEFAULT 0
);

CREATE TABLE booking (
    id               SERIAL PRIMARY KEY,
    client_id        INT NOT NULL REFERENCES client(id) ON DELETE CASCADE,
    photographer_id  INT REFERENCES photographer(id) ON DELETE SET NULL,
    studio_id        INT NOT NULL REFERENCES studio(id) ON DELETE RESTRICT,
    shoot_type_id    INT NOT NULL REFERENCES shoot_type(id) ON DELETE RESTRICT,
    start_time       TIMESTAMP NOT NULL,
    end_time         TIMESTAMP NOT NULL,
    status           VARCHAR(20) NOT NULL DEFAULT 'pending'
                     CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
    total_price      DECIMAL(10, 2),
    CONSTRAINT chk_booking_time CHECK (end_time > start_time)
);

CREATE TABLE print_order (
    id          SERIAL PRIMARY KEY,
    booking_id  INT NOT NULL REFERENCES booking(id) ON DELETE CASCADE,
    photo_count INT NOT NULL DEFAULT 1 CHECK (photo_count > 0),
    format      VARCHAR(20) NOT NULL DEFAULT '10x15',
    paper_type  VARCHAR(50) DEFAULT 'matte',
    price       DECIMAL(10, 2),
    status      VARCHAR(20) NOT NULL DEFAULT 'new'
                CHECK (status IN ('new', 'in_progress', 'ready', 'delivered'))
);
