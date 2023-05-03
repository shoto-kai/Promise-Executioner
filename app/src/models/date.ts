export function encodeDate(date: Date): string;
export function encodeDate(date?: Date): string | undefined;
export function encodeDate(date?: Date): string | undefined {
  if (date == null) {
    return undefined;
  }
  const yyyy = String(date.getUTCFullYear()).padStart(4, "0");
  const MM = String(date.getUTCMonth() + 1).padStart(2, "0");
  const dd = String(date.getUTCDate()).padStart(2, "0");
  const hh = String(date.getUTCHours()).padStart(2, "0");
  const mm = String(date.getUTCMinutes()).padStart(2, "0");
  const ss = String(date.getUTCSeconds()).padStart(2, "0");
  return `${yyyy}-${MM}-${dd}T${hh}:${mm}:${ss}Z`;
}

export function decodeDate(dateString: string): Date;
export function decodeDate(dateString?: string): Date | undefined;
export function decodeDate(dateString?: string) {
  if (dateString == null) {
    return undefined;
  }
  return new Date(dateString);
}
