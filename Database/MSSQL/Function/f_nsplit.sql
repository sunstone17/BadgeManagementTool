/****** Object:  UserDefinedFunction [dbo].[f_nsplit]    Script Date: 2/20/2019 10:12:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER function [dbo].[f_nsplit](@c nvarchar(2000),@split nvarchar(2)) 
returns @t table(col nvarchar(200)) 
as 
    begin 
    
      while(charindex(@split,@c)<>0) 
        begin 
          insert @t(col) values (substring(@c,1,charindex(@split,@c)-1)) 
          set @c = stuff(@c,1,charindex(@split,@c),'') 
        end 
      insert @t(col) values (@c) 
      return 
    end 


