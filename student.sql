CREATE TABLE `student` (
  `studentId` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
   `lastName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE INDEX `student_UNIQUE` (`studentId` ASC) VISIBLE);
  
   
  CREATE TABLE  `teacher` (
  `teacherId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `qualification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`teacherId`),
  UNIQUE INDEX `teacherId_UNIQUE` (`teacherId` ASC) VISIBLE);
  

 CREATE TABLE `teacherstudent` (
  `studentId` int NOT NULL,
  `teacherId` int NOT NULL,
  `subject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studentId`,`teacherId`),
  KEY `teacherId_idx` (`teacherId`),
  CONSTRAINT `teacherId` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`teacherId`) ON UPDATE CASCADE,
  CONSTRAINT `studentId` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`)  ON UPDATE CASCADE
);

 CREATE TABLE  `subjects` (
  `subjectId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `isActive` TINYINT(2) NULL DEFAULT 1,
  PRIMARY KEY (`subjectId`),
  UNIQUE INDEX `subjectId_UNIQUE` (`subjectId` ASC) VISIBLE);
  
CREATE TABLE `grade` (
  `studentId` INT NOT NULL,
   `subjectId` INT NOT NULL,
  `marks` VARCHAR(45) NOT NULL);
  
  ALTER TABLE grade ADD CONSTRAINT studentId_fk1 FOREIGN KEY (studentId) REFERENCES student (studentId) on UPDATE CASCADE;
  
  ALTER TABLE grade ADD CONSTRAINT subjectId_fk1 FOREIGN KEY (subjectId) REFERENCES subjects (subjectId) on UPDATE CASCADE;
  
 
  
insert into student(firstName, lastName, address) values('Albert','Jhon','Washington DC');
insert into student(firstName, lastName, address) values('Mary','Alex','England');
insert into student(firstName, lastName, address) values('Jerry','Vanha','Washington DC');


insert into teacher(name,qualification) values('teacher 1','M.Phil');
insert into teacher(name,qualification) values('teacher 2','P.hd Computers');
insert into teacher(name,qualification) values('teacher 3','P.hd');

insert into teacherstudent (studentId, teacherId,subject) values(1, 3, 'Math');
insert into teacherstudent (studentId, teacherId,subject) values(2, 1, 'English');
insert into teacherstudent (studentId, teacherId,subject) values(3, 2, 'Computers');

insert into subjects(name) values('Math');
insert into subjects(name) values('English');
insert into subjects(name) values('Computers');

insert into grade(studentId, subjectId, marks) values(1,2, '250');
insert into grade(studentId, subjectId, marks) values(2,1, '200');
insert into grade(studentId, subjectId, marks) values(3,3, '230');


insert into student(firstName, lastName, address) values('Elsa','Rub','Washington DC');
insert into teacher(name,qualification) values('teacher 4','P.hd Computers');

update teacherstudent set teacherId=4 where studentId=1;
update grade set marks='260' where studentId=3;

delete from teacher where teacherid=3;

select * from teacherstudent;

select * from teacher t, teacherstudent ts where t.teacherid = ts. teacherid;
select s.firstName, g.marks from student s  join grade g on s.studentId = g.studentId;

select * from student s, grade g where s.studentId=g.studentId;

select * from subjects where subjectId=3;
