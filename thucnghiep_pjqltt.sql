

CREATE TABLE EMPLOYEE ( 
    EmpNo NUMBER(5) NOT NULL, 
    EmpName VARCHAR2(50) NOT NULL, 
    BirthDay DATE NOT NULL, 
    DeptNo NUMBER(5) NOT NULL, 
    MgrNo NUMBER(5), 
    StartDate DATE NOT NULL,
    Salary NUMBER(19,4) NOT NULL,
    EmpLevel NUMBER(3) NOT NULL CHECK (EmpLevel BETWEEN 1 AND 7),  
    EmpStatus NUMBER(3) NOT NULL CHECK(EmpStatus BETWEEN 0 AND 2), 
    Note CLOB,  
    CONSTRAINT PK_Emp PRIMARY KEY (EmpNo)
);
CREATE SEQUENCE skill_seq START WITH 1;

CREATE TABLE SKILL (
    SkillNo number (5) DEFAULT skill_seq.nextval NOT NULL,
    SkillName varchar2(50) NOT NULL, Note long,
    CONSTRAINT PK_Skill PRIMARY KEY (SkillNo) 
);

CREATE SEQUENCE dept_seq START WITH 1;

CREATE TABLE DEPARTMENT(
    DeptNo number (5) DEFAULT dept_seq.nextval NOT NULL, 
    DeptName varchar2 (50) NOT NULL, Note long, 
    CONSTRAINT PK_Department PRIMARY KEY (DeptNo)
);

CREATE TABLE EMP_SKILL(
    SkillNo number(5) NOT NULL,
    EmpNo number (5) NOT NULL,
    SkillLevel number(3) CHECK(SkillLevel BETWEEN 1 AND 3) NOT NULL,
    RegDate date NOT NULL,
    Description long,
    CONSTRAINT PK_EMP_SKILL PRIMARY KEY (SkillNo, EmpNo),
    CONSTRAINT FK_EmpSkill_SKILL FOREIGN KEY (SkillNo) REFERENCES SKILL(SkillNo), 
    CONSTRAINT FK_EmpSkill_EMP FOREIGN KEY (EmpNo) REFERENCES EMPLOYEE (EmpNo) 
);

ALTER TABLE EMPLOYEE ADD EMAIL VARCHAR2 (255);

ALTER TABLE EMPLOYEE ADD CONSTRAINT chk_Email CHECK (Email IS NOT NULL);

ALTER TABLE EMPLOYEE ADD CONSTRAINT chk_Emaill UNIQUE (Email);

ALTER TABLE EMPLOYEE MODIFY MgrNo DEFAULT 0;

ALTER TABLE EMPLOYEE MODIFY EmpStatus DEFAULT 0;

ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMP_DEPT FOREIGN KEY (DeptNo) REFERENCES DEPARTMENT (DeptNo);

ALTER TABLE EMP_SKILL DROP COLUMN Description;

--DEPARTMENT

INSERT INTO DEPARTMENT (DeptNo, DeptName) VALUES (dept_seq.nextval, 'DeptNamel');

INSERT INTO DEPARTMENT (DeptNo, DeptName) VALUES (dept_seq.nextval, 'DeptName2');

INSERT INTO DEPARTMENT (DeptNo, DeptName) VALUES (dept_seq.nextval, 'DeptName3');

INSERT INTO DEPARTMENT (DeptNo, DeptName) VALUES (dept_seq.nextval, 'DeptName4');

INSERT INTO DEPARTMENT (DeptNo, DeptName) VALUES (dept_seq.nextval, 'DeptName5');

--EMPLOYEE

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (1,'Name1', to_date('11/1/1998','dd/mm/yyyy'), 1, 3, to_date ('11/1/2000','dd/mm/yyyy'),2000000,1,'′Notel',1,'mail@com.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (2, 'Name2', to_date('1/1/1998','dd/mm/yyyy'), 2, 1, to_date('1/1/2000','dd/mm/yyyy'), 2000000,1,'Notel',1,'mail2@com.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (3, 'Name3', to_date ('1/1/1998','dd/mm/yyyy'), 3, 3, to_date ('1/1/2000','dd/mm/yyyy'),2000000,1,'Notel',1,'mail3@com.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (4, 'Name4', to_date ('11/1/1998','dd/mm/yyyy'), 4, 1, to_date ('11/1/2000','dd/mm/yyyy'),2000000,1,'Notel',1,'mail4@com.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (5, 'Name5', to_date ('11/1/1998','dd/mm/yyyy'), 5, 1, to_date ('11/1/2000','dd/mm/yyyy'),2000000,1,'Notel',1,'mail5@com.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (6, N'Trần Đại Hiển', to_date ('19/10/2004','dd/mm/yyyy'), 3, 3, to_date ('19/10/2024','dd/mm/yyyy'),4000000,1,'Notel',1,'22520460@gm.uit.edu.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (7, N'Phạm Ngọc Trí', to_date ('18/10/2004','dd/mm/yyyy'), 2, 1, to_date ('19/10/2024','dd/mm/yyyy'),5000000,1,'Notel',1,'22521526@gm.uit.edu.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (8, N'Trần Lương Vân Nhi', to_date ('20/10/2004','dd/mm/yyyy'), 4, 3, to_date ('19/10/2024','dd/mm/yyyy'),4000000,1,'Notel',1,'22521044@gm.uit.edu.vn');

INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, Note, EmpLevel, Email) VALUES (9, N'Phạm Gia Bảo', to_date ('17/6/2004','dd/mm/yyyy'), 5, 1, to_date ('19/10/2024','dd/mm/yyyy'),2000000,1,'Notel',1,'22520115@gm.uit.edu.vn');
UPDATE Employee SET Salary = 6000000 WHERE EmpNo =7;
DELETE FROM Employee WHERE EmpNo = 1;
--SKILL

INSERT INTO SKILL (SkillNo, SkillName) VALUES (skill_seq.nextval, 'Skilll');

INSERT INTO SKILL (SkillNo, SkillName) VALUES (skill_seq.nextval, 'Skill2');

INSERT INTO SKILL (SkillNo, SkillName) VALUES(skill_seq.nextval, 'Skill3');

INSERT INTO SKILL(SkillNo, SkillName) VALUES (skill_seq.nextval,'Skill4');

INSERT INTO SKILL (SkillNo, SkillName) VALUES (skill_seq.nextval,'Skill5');

--EMP-SKILL

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (1, 1, 1, TO_DATE('11/1/2001','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (1, 2, 1, TO_DATE('11/1/2002','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (1, 3, 1, TO_DATE ('1/1/2003','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (2, 1, 2, TO_DATE ('1/1/2004','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (2, 2, 1, TO_DATE ('1/1/2005','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (3, 3, 1, TO_DATE ('1/1/2005','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (2, 3, 1, TO_DATE ('1/1/2005','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (4, 3, 1, TO_DATE ('1/1/2005','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (2, 6, 1, TO_DATE ('1/1/2010','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (3, 7, 2, TO_DATE ('1/1/2012','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (4, 8, 2, TO_DATE ('1/1/2014','dd/mm/yyyy'));

INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) VALUES (2, 9, 3, TO_DATE ('1/1/2024','dd/mm/yyyy'));

CREATE VIEW Employee_Tranking AS 
    SELECT EmpNo, EmpName, EmpLevel 
    FROM Employee 
    WHERE EmpLevel BETWEEN 3 AND 5;
    
SELECT E.EmpName, E.Email, D.DeptName 
FROM Employee E 
INNER JOIN Department D ON E.DeptNo = D.DeptNo
WHERE MONTHS_BETWEEN(SYSDATE, E.StartDate) >= 1;

SELECT E.EmpName, S.SkillName 
FROM Employee E 
INNER JOIN Emp_Skill ES ON E.EmpNo = ES.EmpNo
INNER JOIN Skill S ON S.SkillNo = ES.SkillNo
WHERE S.SkillName LIKE '%NET%' OR S.SkillName LIKE '%C++%'


SELECT EmpName, Salary FROM Employee WHERE Salary > 5000;

SELECT DeptNo, COUNT(*) FROM Employee GROUP BY DeptNo;

SELECT DeptNo, COUNT(*) FROM Employee GROUP BY DeptNo HAVING COUNT(*) > 1;


SELECT 
    E.EmpName AS TenNV, 
    E.MgrNo AS MaQL, 
    (SELECT T.EmpName 
     FROM Employee T 
     WHERE E.MgrNo = T.EmpNo 
     AND ROWNUM = 1) AS TenQL
FROM Employee E;

SELECT D.DeptNo, D.DeptName, E.EmpName 
FROM Employee E 
INNER JOIN Department D ON E.DeptNo = D. DeptNo
GROUP BY D.DeptNo, D.DeptName, E.EmpName 
HAVING COUNT (E. EmpName) >= 1

SELECT E.EmpName, E.Email, S.SkillNo 
FROM Employee E 
INNER JOIN Emp_Skill S ON E.EmpNo = S.EmpNo
ORDER BY E.EmpName

SELECT E.EmpName, E.Email
FROM Employee E
WHERE EXISTS (
    SELECT S.EmpNo 
    FROM Emp_Skill S 
    WHERE S.EmpNo = E.EmpNo 
    GROUP BY S.EmpNo 
    HAVING COUNT(*) > 1
) AND E.EmpStatus = 1;

SELECT NVL(Salary, 0) FROM Employee;

-- USER SQL
CREATE USER Giabao IDENTIFIED BY "giabao123"  
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- QUOTAS
ALTER USER "Gia_bao" QUOTA 0M ON "SYSTEM";
ALTER USER "Gia_bao" QUOTA UNLIMITED ON "USERS";

-- ROLES
GRANT "CONNECT" TO "Gia_bao" ;
GRANT "RESOURCE" TO "Gia_bao" ;

-- SYSTEM PRIVILEGES
GRANT UNLIMITED TABLESPACE TO "Gia_bao" ;

CREATE OR REPLACE TRIGGER check_salary
BEFORE INSERT OR UPDATE OF EmpLevel, Salary ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF :NEW.EmpLevel = 1 AND :NEW.Salary > 10000000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid employee information: Level 1 cannot have salary > 10,000,000');
    END IF;
END;


CREATE USER C##Giabao IDENTIFIED BY "giabao123"  
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
GRANT CONNECT, RESOURCE TO C##Giabao;