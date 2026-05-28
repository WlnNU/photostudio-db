INSERT INTO client (name, phone, email, birth_date) VALUES
    ('Анна Смирнова',  '+7-901-111-22-33', 'anna@mail.ru',   '1990-05-14'),
    ('Иван Петров',    '+7-902-444-55-66', 'ivan@gmail.com', '1985-11-23'),
    ('Мария Иванова',  '+7-903-777-88-99', 'maria@yandex.ru','1995-03-08');

INSERT INTO photographer (name, phone, specialization, rate_per_hour) VALUES
    ('Дмитрий Волков', '+7-910-000-11-22', 'Портрет',           3500.00),
    ('Екатерина Нова', '+7-911-333-44-55', 'Предметная съёмка', 2800.00),
    ('Алексей Козлов', '+7-912-666-77-88', 'Репортаж',          4000.00);

INSERT INTO shoot_type (name, description, base_price) VALUES
    ('Портретная', 'Индивидуальные и семейные портреты', 5000.00),
    ('Love Story',  'Съёмка влюблённых пар',             8000.00),
    ('Предметная',  'Товары и продукты для каталогов',   6000.00),
    ('Детская',     'Съёмка детей и новорождённых',      7000.00);

INSERT INTO studio (name, address, capacity, price_per_hour) VALUES
    ('Студия A', 'ул. Ленина, 10, зал 1', 5,  1500.00),
    ('Студия B', 'ул. Ленина, 10, зал 2', 10, 2500.00),
    ('Студия C', 'пр. Мира, 5',           15, 3500.00);

INSERT INTO booking (client_id, photographer_id, studio_id, shoot_type_id,
                     start_time, end_time, status, total_price) VALUES
    (1, 1, 1, 1, '2025-06-10 10:00', '2025-06-10 12:00', 'confirmed', 11000.00),
    (2, 2, 2, 3, '2025-06-11 14:00', '2025-06-11 16:00', 'pending',   12600.00),
    (3, 3, 3, 2, '2025-06-12 09:00', '2025-06-12 11:00', 'completed', 16000.00);

INSERT INTO print_order (booking_id, photo_count, format, paper_type, price, status) VALUES
    (1, 10, '10x15', 'matte',  500.00,  'ready'),
    (1,  5, '20x30', 'glossy', 750.00,  'delivered'),
    (3, 20, '10x15', 'matte',  1000.00, 'in_progress');
