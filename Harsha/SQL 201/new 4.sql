SELECT
  airline_name,
  COUNT(DISTINCT flight_number) AS no_of_flights,
  COUNT(
    CASE
      WHEN arrival_delay > 0 THEN TRUE
      ELSE NULL
    END
  ) AS no_delayed_flights,
  (
    COUNT(
      CASE
        WHEN arrival_delay > 0 THEN TRUE
        ELSE NULL
      END
    )
  ) * 100 / count(*) AS percentage_of_delayed_flights,
  COUNT(
    CASE
      WHEN was_cancelled = TRUE THEN TRUE
      ELSE NULL
    END
  ) AS no_of_cancelled_flights,
  (
    COUNT(
      CASE
        WHEN was_cancelled = TRUE THEN TRUE
        ELSE NULL
      END
    ) * 100
  ) / count(*) AS percentage_of_cancelled_flights,
  COUNT(DISTINCT destination_airport) AS no_of_destinations_covered
FROM
  tutorial.flights
GROUP BY
  airline_name