CREATE PROCEDURE insertStoredP
  @name  VARCHAR(150)  ,
  @title VARCHAR(255)
  AS
        IF NOT EXISTS(SELECT presentation.title FROM presentation WHERE title = @title)
          BEGIN TRY
          INSERT INTO presentation
            (title, speaker)
          VALUES
            (@title, @name)
            END TRY
            BEGIN CATCH
              PRINT 'Error inserting Presentation'
            END CATCH
        IF NOT EXISTS (SELECT person.person_ID From person
        WHERE first_name = SUBSTRING(@name, 1, CHARINDEX(' ', @name) - 1)
          AND last_Name = REVERSE(SUBSTRING(REVERSE(@name), 1, CHARINDEX(' ', REVERSE(@name)) - 1)))
          BEGIN TRY
            INSERT INTO person
            (first_name, last_name)
            VALUES
              (SUBSTRING(@name, 1, CHARINDEX(' ', @name) - 1), REVERSE(SUBSTRING(REVERSE(@name), 1, CHARINDEX(' ', REVERSE(@name)) - 1)))
          END TRY 
            BEGIN CATCH 
              PRINT 'Error inserting Speaker' 
            END CATCH
go


EXEC insertStoredP 'Armenak Mazmanyan', 'Working with stored procedures.'