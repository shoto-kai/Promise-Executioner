export class TaskLimitDate {
  static readonly H_PER_DAY = 24; /* [h/day] */
  static readonly MIN_PER_H = 60; /* [min/h] */
  static readonly S_PER_MIN = 60; /* [s/min] */
  static readonly MS_PER_S = 1000; /*[ms/s] */

  constructor(readonly date: Date) {}

  restTime(now: Date = new Date()): string {
    if (this.isDayUnit(now)) return this.dayUnitRestTimeText(now);
    if (this.isHourUnit(now)) return this.hourUnitRestTimeText(now);
    return this.lessThanMinutesUnitRestTimeText(now);
  }

  /** 日単位か */
  private isDayUnit(now: Date): boolean {
    return this.diffDays(now) > 0;
  }

  /** 時間単位か */
  private isHourUnit(now: Date): boolean {
    return !this.isDayUnit(now) && this.restHours(now) > 0;
  }

  /** 日単位の残り時間 */
  private dayUnitRestTimeText(now: Date): string {
    return `${this.diffDays(now)}日${this.restHoursText(now)}時間`;
  }

  /** 時間単位の残り時間 */
  private hourUnitRestTimeText(now: Date): string {
    return `${this.restHoursText(now)}時間${this.restMinutesText(now)}分`;
  }

  /** 秒・分単位の残り時間 */
  private lessThanMinutesUnitRestTimeText(now: Date): string {
    return `${this.restMinutesText(now)}分${this.restSecondsText(now)}秒`;
  }

  /** 2文字の0埋め残り時間 */
  private restHoursText(now: Date): string {
    return String(this.restHours(now)).padStart(2, "0");
  }

  /** 2文字の0埋め残り分 */
  private restMinutesText(now: Date): string {
    return String(this.restMinutes(now)).padStart(2, "0");
  }

  /** 2文字の0埋め残り秒 */
  private restSecondsText(now: Date): string {
    return String(this.restSeconds(now)).padStart(2, "0");
  }

  /** 残り時間数 */
  private restHours(now: Date): number {
    return this.diffHours(now) % TaskLimitDate.H_PER_DAY;
  }

  /** 残り分数 */
  private restMinutes(now: Date): number {
    return this.diffMinutes(now) % TaskLimitDate.MIN_PER_H;
  }

  /** 残り秒数 */
  private restSeconds(now: Date): number {
    return this.diffSeconds(now) % TaskLimitDate.S_PER_MIN;
  }

  /** 差分[day] */
  private diffDays(now: Date): number {
    return Math.floor(this.diffHours(now) / TaskLimitDate.H_PER_DAY);
  }

  /** 差分[h] */
  private diffHours(now: Date): number {
    return Math.floor(this.diffMinutes(now) / TaskLimitDate.MIN_PER_H);
  }

  /** 差分[min] */
  private diffMinutes(now: Date): number {
    return Math.floor(this.diffSeconds(now) / TaskLimitDate.S_PER_MIN);
  }

  /** 差分[s] */
  private diffSeconds(now: Date): number {
    return Math.floor(this.diffTime(now) / TaskLimitDate.MS_PER_S);
  }

  /** 差分[ms] */
  private diffTime(now: Date): number {
    return this.date.getTime() - now.getTime();
  }
}
