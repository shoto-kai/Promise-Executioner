import React, { useRef, useEffect, useState } from "react";
import Marker from "./Marker";

interface GoogleMapProps {
  apiKey: string;
  center: {
    lat: number;
    lng: number;
  };
  zoom: number;
  // markerPosition: { lat: number, lng: number } | null;
  // setMarkerPosition: (position: { lat: number, lng: number } | null) => void;
}

// const GoogleMap: React.FC<GoogleMapProps> = ({ apiKey, center, zoom, markerPosition, setMarkerPosition }) => {
const GoogleMap: React.FC<GoogleMapProps> = ({ apiKey, center, zoom }) => {
  const mapRef = useRef<HTMLDivElement>(null);
  const [map, setMap] = useState<google.maps.Map | null>(null);
  const [markerPosition, setMarkerPosition] = useState<{
    lat: number;
    lng: number;
  } | null>(null);

  useEffect(() => {
    if (mapRef.current) {
      if (window.google && window.google.maps) {
        const newMap = new google.maps.Map(mapRef.current, {
          center: center,
          zoom: zoom,
        });
        setMap(newMap);
        setMarkerPosition(center);
      } else {
        const script = document.createElement("script");
        script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}`;
        script.async = true;
        script.defer = true;
        script.onload = () => {
          if (mapRef.current) {
            const newMap = new google.maps.Map(mapRef.current, {
              center: center,
              zoom: zoom,
            });
            setMap(newMap);
            setMarkerPosition(center);
          }
        };
        document.head.appendChild(script);
      }
    }
    // }, [apiKey, center, zoom, setMarkerPosition]);
  }, [apiKey, center, zoom]);

  useEffect(() => {
    if (map) {
      map.addListener("click", (event) => {
        setMarkerPosition({ lat: event.latLng.lat(), lng: event.latLng.lng() });
      });
    }
  }, [map, setMarkerPosition]);

  return (
    <div
      ref={mapRef}
      style={{ width: "100%", height: "100%", marginBottom: "2rem" }}
    >
      {markerPosition && (
        <Marker
          position={{ lat: markerPosition.lat, lng: markerPosition.lng }}
          map={map}
        />
      )}
    </div>
  );
};

export default GoogleMap;
