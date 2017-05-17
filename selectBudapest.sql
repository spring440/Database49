CREATE PROCEDURE selectBudapest
@track VARCHAR(150)
AS
BEGIN TRY
SELECT event, title as pesentaion, track.name as track FROM presentation
	INNER JOIN track ON presentation.track_id = track.track_id
	WHERE event = 'Budapest' AND track.name = @track
	END TRY
	BEGIN CATCH
	PRINT 'Could not find matching presentations'
	END CATCH
	GO

	EXEC selectBudapest 'Administración 02'