-- ==============================================================================
-- Script para restauração do banco de dados AdventureWorksDW2025
-- Origem: /var/opt/mssql/backup/AdventureWorksDW2025.bak (montado via volume Docker)
-- ==============================================================================

USE [master];
GO

-- 1. Verifica os nomes lógicos contidos no backup
-- RESTORE FILELISTONLY FROM DISK = '/var/opt/mssql/backup/AdventureWorksDW2025.bak';
-- GO

-- 2. Restaura o banco de dados mapeando os arquivos para o diretório padrão do container
RESTORE DATABASE [AdventureWorksDW2025]
FROM DISK = '/var/opt/mssql/backup/AdventureWorksDW2025.bak'
WITH 
    MOVE 'AdventureWorksDW' TO '/var/opt/mssql/data/AdventureWorksDW2025.mdf',
    MOVE 'AdventureWorksDW_log' TO '/var/opt/mssql/data/AdventureWorksDW2025_log.ldf',
    REPLACE,
    STATS = 10;
GO

-- 3. Validação pós-restauração
SELECT name, state_desc, create_date 
FROM sys.databases 
WHERE name = 'AdventureWorksDW2025';
GO
