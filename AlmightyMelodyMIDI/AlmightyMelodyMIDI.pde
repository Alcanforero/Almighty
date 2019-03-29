import arb.soundcipher.*;

SCScore score = new SCScore();

score.addNote(0, 57, 80, 1.5);
score.addNote(1.5, 59, 80, 0.5);
score.addNote(2, 60, 80, 0.5);
score.addNote(2.5, 55, 80, 0.5);
score.addNote(3, 64, 80, 0.5);
score.addNote(3.5, 62, 80, 0.5);

score.addNote(4, 62, 80, 1);
score.addNote(5, 62, 80, 0.5);
score.addNote(5.5, 59, 80, 0.5);
score.addNote(6, 60, 80, 0.25);
score.addNote(6.25, 60, 80, 0.25);
score.addNote(6.5, 59, 80, 0.5);
score.addNote(7, 57, 80, 0.5);
score.addNote(7.5, 55, 80, 0.5);

score.addNote(8, 57, 80, 1.25);
score.addNote(9.25, 57, 80, 0.25);
score.addNote(9.5, 57, 80, 0.25);
score.addNote(9.75, 59, 80, 0.25);
score.addNote(10, 60, 80, 0.25);
score.addNote(10.25, 60, 80, 0.25);
score.addNote(10.5, 55, 80, 0.5);
score.addNote(11, 64, 80, 0.5);
score.addNote(11.5, 62, 80, 0.5);

score.addNote(12, 62, 80, 0.5);
score.addNote(12.5, 64, 80, 0.25);
score.addNote(12.75, 62, 80, 0.25);
score.addNote(13, 60, 80, 0.5);
score.addNote(13.5, 59, 80, 0.5);
score.addNote(14, 57, 80, 1);
score.addNote(15, 57, 80, 0.5);
score.addNote(15.5, 55, 80, 0.4);

score.play();

score.writeMidiFile("I:\\Universidad\\Cuarto\\SegundoCurso\\CIU\\sketchs\\Clase 7\\sketch_190319b\\score.mid");
