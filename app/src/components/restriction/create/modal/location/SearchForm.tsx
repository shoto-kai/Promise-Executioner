// SearchForm.tsx
import React, { useState } from "react";

interface SearchFormProps {
  onSearch: (input: string) => void;
}

import { IonInput, IonItem, IonLabel } from "@ionic/react";
const SearchForm: React.FC<SearchFormProps> = ({ onSearch }) => {
  const [preInput, setPreInput] = useState("");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSearch(preInput);
  };

  return (
    <form onSubmit={handleSubmit}>
      <IonItem>
        <IonLabel position="stacked">キーワードから探す</IonLabel>
        <IonInput
          type="text"
          placeholder="渋谷ソラスタ"
          value={preInput}
          onChange={(e) => setPreInput("")}
        ></IonInput>
      </IonItem>
    </form>
  );
};

export default SearchForm;
