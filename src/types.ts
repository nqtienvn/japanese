export type Mode = 'flashcard' | 'study' | 'quiz';
export type View = 'dashboard' | 'notebook' | 'flashcard' | 'study' | 'quiz';
export type Direction = 'jp_to_vi' | 'vi_to_jp';
export type QuestionMode = 'multiple_choice' | 'written' | 'mixed';

export type Term = {
  id: string;
  japanese: string;
  vietnamese: string;
  modes: Mode[];
  archivedAt: string | null;
  createdAt: string;
};

export type LearningStats = { correct: number; wrong: number };

export type QuizAttempt = {
  id: string;
  sourceMode: 'all' | 'quiz';
  questionMode: QuestionMode;
  direction: Direction;
  questionCount: number;
  durationSeconds: number;
  startedAt: string;
  deadlineAt: string;
  status: 'active' | 'submitted' | 'expired';
  submittedAt: string | null;
};

export type QuizAnswer = {
  id: string;
  attemptId: string;
  termId: string;
  position: number;
  questionType: Exclude<QuestionMode, 'mixed'>;
  answer: string | null;
  correct: boolean | null;
  answeredAt: string | null;
};

export type QuizResult = {
  status: 'submitted' | 'expired';
  correctCount: number;
  questionCount: number;
  submittedAt: string;
};
