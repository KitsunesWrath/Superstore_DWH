/* Execute procedures */

/* LANDING TO STAGING */
EXEC [Cfg].[LS_Superstore]
EXEC [Cfg].[LS_People]
EXEC [Cfg].[LS_Returns]

/* INDEPENDENT DIMS */
EXEC [Cfg].[LR_Category]
EXEC [Cfg].[LR_City]
EXEC [Cfg].[LR_Country]
EXEC [Cfg].[LR_Customer]
EXEC [Cfg].[LR_Order]
EXEC [Cfg].[LR_People]
EXEC [Cfg].[LR_Product]
EXEC [Cfg].[LR_Segment]
EXEC [Cfg].[LR_Ship]
EXEC [Cfg].[LR_State]
EXEC [Cfg].[LR_Subcategory]

/* DEPENDENT DIMS */
EXEC [Cfg].[LR_Region]

/* FACTS */
EXEC [Cfg].[LF_Superstore]
