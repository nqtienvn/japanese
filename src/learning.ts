export const normalizeAnswer = (value: string) => value.trim().normalize('NFC').toLocaleLowerCase();
export const isVietnameseAnswerCorrect = (answer: string, expected: string) => normalizeAnswer(answer) === normalizeAnswer(expected);
export const isQuizExpired = (deadlineMs: number, nowMs = Date.now()) => nowMs >= deadlineMs;
