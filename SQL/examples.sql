SELECT
	*
FROM
	FamilyNames FN
WHERE
	dbo.IsMatch(FN.Name, '..+''.*') = 1
	