import { useState, useEffect } from "react";

interface GeocodeResult {
  lat: number;
  lng: number;
}

export const useGeocode = (apiKey: string, address: string) => {
  const [coordinates, setCoordinates] = useState<GeocodeResult | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (address) {
      const fetchCoordinates = async () => {
        try {
          const response = await fetch(
            `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(
              address
            )}&key=${apiKey}`
          );
          const data = await response.json();
          if (data.status === "OK") {
            const location = data.results[0].geometry.location;
            setCoordinates({ lat: location.lat, lng: location.lng });
          } else {
            setError(data.status);
          }
        } catch (err) {
          setError((err as Error).message);
        }
      };
      fetchCoordinates();
    }
  }, [apiKey, address]);

  return { coordinates, error };
};
