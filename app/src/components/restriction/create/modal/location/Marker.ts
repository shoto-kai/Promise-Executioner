import React, { useEffect } from "react";

interface MarkerProps {
  position: {
    lat: number;
    lng: number;
  };
  map: google.maps.Map | null;
}

const Marker: React.FC<MarkerProps> = ({ position, map }) => {
  useEffect(() => {
    if (map) {
      // マーカーを追加
      const marker = new google.maps.Marker({
        position: position,
        map: map,
      });

      const circle = new google.maps.Circle({
        strokeColor: "#127BE1",
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: "#127BE1",
        fillOpacity: 0.35,
        map,
        center: position,
        radius: 2000, // 半径（メートル単位）
      });

      return () => {
        marker.setMap(null);
        circle.setMap(null);
      };
    }
  }, [map, position]);

  return null;
};

export default Marker;
