create database milodrive;
use milodrive; 

-- creating tables for each sheet

CREATE TABLE trip_activity (
    trip_uuid VARCHAR(50),
    driver_uuid VARCHAR(50),
    vehicle_uuid VARCHAR(50),
    number_plate VARCHAR(20),
    service_type VARCHAR(50),
    trip_request_time VARCHAR(20),
    trip_dropoff_time VARCHAR(20),
    trip_distance DECIMAL(10,2),
    trip_status VARCHAR(20)
);

ALTER TABLE trip_activity
ADD COLUMN request_time DATETIME,
ADD COLUMN dropoff_time DATETIME;

SET SQL_SAFE_UPDATES = 0;

UPDATE trip_activity
SET
    request_time = CASE
        WHEN trip_request_time IS NULL OR TRIM(trip_request_time) = ''
        THEN NULL
        ELSE STR_TO_DATE(trip_request_time, '%d/%m/%y %H:%i')
    END,

    dropoff_time = CASE
        WHEN trip_dropoff_time IS NULL OR TRIM(trip_dropoff_time) = ''
        THEN NULL
        ELSE STR_TO_DATE(trip_dropoff_time, '%d/%m/%y %H:%i')
    END;
    
CREATE TABLE payment_transactions (
    transaction_uuid VARCHAR(50),
    driver_uuid VARCHAR(50),
    trip_uuid VARCHAR(50),
    description VARCHAR(100),

    vs_reporting VARCHAR(50),

    paid_to_you DECIMAL(10,2),
    paid_to_you_your_earnings DECIMAL(10,2),
    paid_to_you_trip_balance_payouts_cash_collected DECIMAL(10,2),
    paid_to_you_your_earnings_fare DECIMAL(10,2),
    paid_to_you_your_earnings_taxes DECIMAL(10,2),
    paid_to_you_your_earnings_fare_fare DECIMAL(10,2),
    paid_to_you_trip_balance_refunds_toll DECIMAL(10,2),
    paid_to_you_your_earnings_tip DECIMAL(10,2),
    paid_to_you_your_earnings_taxes_income_tax_withholding DECIMAL(10,2),
    paid_to_you_your_earnings_fare_booking_fee DECIMAL(10,2),
    paid_to_you_your_earnings_fare_uberx_priority DECIMAL(10,2),
    paid_to_you_your_earnings_fare_max_fare_adjustment DECIMAL(10,2),
    paid_to_you_your_earnings_fare_wait_time_at_pickup DECIMAL(10,2),
    paid_to_you_your_earnings_fare_package_fare DECIMAL(10,2),
    paid_to_you_your_earnings_fare_additional_time_charges DECIMAL(10,2),
    paid_to_you_your_earnings_fare_adjustment DECIMAL(10,2),
    paid_to_you_your_earnings_fare_surge DECIMAL(10,2),
    paid_to_you_your_earnings_fare_cancellation DECIMAL(10,2),
    paid_to_you_your_earnings_fare_additional_cancellation_fee DECIMAL(10,2),
    paid_to_you_your_earnings_fare_reservation_fee DECIMAL(10,2)
);
CREATE TABLE driver_activity (
    driver_uuid VARCHAR(50) PRIMARY KEY,
    time_online TIME,
    time_on_trip TIME
);

-- Total trips per driver
SELECT
    driver_uuid,
    COUNT(*) AS total_trips
FROM trip_activity
GROUP BY driver_uuid;

-- Completed trips
SELECT
    driver_uuid,
    COUNT(*) AS completed_trips
FROM trip_activity
WHERE trip_status='completed'
GROUP BY driver_uuid;

-- Completion rate
SELECT
    driver_uuid,

    COUNT(*) AS total_trips,

    SUM(CASE
            WHEN trip_status='completed'
            THEN 1
            ELSE 0
        END) AS completed_trips,

    ROUND(
        100 *
        SUM(CASE
                WHEN trip_status='completed'
                THEN 1
                ELSE 0
            END)
        / COUNT(*),
        2
    ) AS completion_rate

FROM trip_activity

GROUP BY driver_uuid;

-- Trip status distribution
SELECT
    trip_status,
    COUNT(*)
FROM trip_activity
GROUP BY trip_status;

-- Payment records per driver
SELECT
    driver_uuid,
    COUNT(*)
FROM payment_transactions
GROUP BY driver_uuid;

-- Driver activity
SELECT *
FROM driver_activity;