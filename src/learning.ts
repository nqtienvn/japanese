export const normalizeAnswer = (value: string) => value.normalize('NFC').trim().replace(/\s+/g, ' ').toLocaleLowerCase('vi');
export const isAnswerCorrect = (answer: string, expected: string) => normalizeAnswer(answer) === normalizeAnswer(expected);
export const isVietnameseAnswerCorrect = isAnswerCorrect;
export const isQuizExpired = (deadlineMs: number, nowMs = Date.now()) => nowMs >= deadlineMs;
