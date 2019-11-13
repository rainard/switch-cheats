INSERT INTO Types (Type,			Kind) VALUES 
('BELIEF_KING_OF_THE_GODS',			'KIND_BELIEF'),
('BELIEF_KING_OF_THE_GODS_FOUNDER',	'KIND_BELIEF'),
('BELIEF_KING_OF_THE_GODS_FOLLOWER','KIND_BELIEF'),
('BELIEF_KING_OF_THE_GODS_ENHANCER','KIND_BELIEF');

INSERT INTO Beliefs (BeliefType,			Name,				  Description,	   BeliefClassType)
SELECT 'BELIEF_KING_OF_THE_GODS',			'众神之王(万神殿)', '万神殿信条合一','BELIEF_CLASS_PANTHEON' 	WHERE EXISTS (SELECT BeliefType FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_PANTHEON') AND (SELECT Retain FROM MySpecialSetting WHERE Name = '众神之王') = "要" Union
SELECT 'BELIEF_KING_OF_THE_GODS_FOUNDER',	'众神之王(创立者)',	  '创立者信条合一','BELIEF_CLASS_FOUNDER' 	WHERE EXISTS (SELECT BeliefType FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_FOUNDER'	) AND (SELECT Retain FROM MySpecialSetting WHERE Name = '众神之王') = "要" Union
SELECT 'BELIEF_KING_OF_THE_GODS_FOLLOWER',	'众神之王(追随者)',	  '追随者信条合一','BELIEF_CLASS_FOLLOWER' 	WHERE EXISTS (SELECT BeliefType FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER') AND (SELECT Retain FROM MySpecialSetting WHERE Name = '众神之王') = "要" Union
SELECT 'BELIEF_KING_OF_THE_GODS_ENHANCER',	'众神之王(强化者)',	  '强化者信条合一','BELIEF_CLASS_ENHANCER' 	WHERE EXISTS (SELECT BeliefType FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_ENHANCER') AND (SELECT Retain FROM MySpecialSetting WHERE Name = '众神之王') = "要";

INSERT INTO BeliefModifiers(BeliefType, 			ModifierId) 
SELECT DISTINCT 'BELIEF_KING_OF_THE_GODS', 			ModifierId FROM BeliefModifiers WHERE 'BELIEF_KING_OF_THE_GODS' 		 IN (SELECT BeliefType FROM Beliefs) AND BeliefType IN ( SELECT BeliefType FROM Beliefs WHERE BeliefClassType = "BELIEF_CLASS_PANTHEON") Union
SELECT DISTINCT 'BELIEF_KING_OF_THE_GODS_FOUNDER',  ModifierId FROM BeliefModifiers WHERE 'BELIEF_KING_OF_THE_GODS_FOUNDER'  IN (SELECT BeliefType FROM Beliefs) AND BeliefType IN ( SELECT BeliefType FROM Beliefs WHERE BeliefClassType = "BELIEF_CLASS_FOUNDER" )  Union
SELECT DISTINCT 'BELIEF_KING_OF_THE_GODS_FOLLOWER', ModifierId FROM BeliefModifiers WHERE 'BELIEF_KING_OF_THE_GODS_FOLLOWER' IN (SELECT BeliefType FROM Beliefs) AND BeliefType IN ( SELECT BeliefType FROM Beliefs WHERE BeliefClassType = "BELIEF_CLASS_FOLLOWER") Union
SELECT DISTINCT 'BELIEF_KING_OF_THE_GODS_ENHANCER', ModifierId FROM BeliefModifiers WHERE 'BELIEF_KING_OF_THE_GODS_ENHANCER' IN (SELECT BeliefType FROM Beliefs) AND BeliefType IN ( SELECT BeliefType FROM Beliefs WHERE BeliefClassType = "BELIEF_CLASS_ENHANCER");

UPDATE MySpecialSetting SET Retain='不要'		WHERE Name = '自动添加万神殿' AND parameter1 NOT IN (SELECT BeliefType FROM Beliefs);
