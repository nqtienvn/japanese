import { describe, expect, it } from 'vitest';
import { isQuizExpired, isVietnameseAnswerCorrect } from './learning';

describe('learning rules', () => {
  it('keeps Vietnamese diacritics significant while normalising whitespace and case', () => {
    expect(isVietnameseAnswerCorrect('  CON MÈO ', 'con mèo')).toBe(true);
    expect(isVietnameseAnswerCorrect('con meo', 'con mèo')).toBe(false);
  });
  it('treats the authoritative deadline as expired at the deadline instant', () => {
    expect(isQuizExpired(1000, 999)).toBe(false);
    expect(isQuizExpired(1000, 1000)).toBe(true);
  });
});
