import { describe, expect, it } from 'vitest';
import { isQuizExpired, isVietnameseAnswerCorrect } from './learning';

describe('learning rules', () => {
  it('keeps Vietnamese diacritics significant while normalising whitespace and case', () => {
    expect(isVietnameseAnswerCorrect('  CON M\u00c8O ', 'con m\u00e8o')).toBe(true);
    expect(isVietnameseAnswerCorrect('con meo', 'con m\u00e8o')).toBe(false);
  });
  it('collapses interior whitespace and canonical Unicode composition', () => {
    expect(isVietnameseAnswerCorrect('a   b', 'A b')).toBe(true);
    expect(isVietnameseAnswerCorrect('e\u0300', '\u00e8')).toBe(true);
  });
  it('treats the authoritative deadline as expired at the deadline instant', () => {
    expect(isQuizExpired(1000, 999)).toBe(false);
    expect(isQuizExpired(1000, 1000)).toBe(true);
  });
});
