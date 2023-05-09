export default function PenaltyCreateButton({
  onClick,
}: {
  onClick: () => void;
}) {
  return <button onClick={onClick}>ペナルティ作成ボタン</button>;
}
