export type Mode = 'flashcard' | 'study' | 'quiz';
export type Term = { id: string; japanese: string; vietnamese: string; modes: Mode[]; archived: boolean; createdAt: string; correct: number; wrong: number };
export type View = 'dashboard' | 'notebook' | 'flashcard' | 'study' | 'quiz';
