VERSION = "1.0.0"

local micro  = import("micro")
local config = import("micro/config")
local util   = import("micro/util")
local regexp = import("regexp")

function shouldDedent(bp)
   local regex = bp.Buf.Settings["dedent.regex"]

   if regex == "" then
      return false
   end

   local line = bp.Buf:Line(bp.Cursor.Y):sub(1, bp.Cursor.X)

   local matched, err = regexp.MatchString(regex, line)

   if err ~= nil then
      micro.InfoBar():Error(err)
      return false
   end

   if not matched then
      return false
   end

   local unless_regex = bp.Buf.Settings["dedent.unless"]

   if unless_regex == "" then
      return true
   end

   local matched, err = regexp.MatchString(regex, line)

   if err ~= nil then
      micro.InfoBar():Error(err)
      return false
   end

   if matched then
      return false
   end

   return true
end

function canDedent(bp)
   local line = bp.Buf:Line(bp.Cursor.Y)

   if bp.Buf.Settings["tabstospaces"] then
      for offset = 1, bp.Buf.Settings["tabsize"] do
         if util.RuneAt(line, offset - 1) ~= " " then
            return false
         end
      end
      return true
   else
      return util.RuneAt(line, 0) == "\t"
   end
end

function dedentLine(bp)
   if not canDedent(bp) then
      return
   end

   bp:StartOfLine()
   if bp.Buf.Settings["tabstospaces"] then
      for offset = 1, bp.Buf.Settings["tabsize"] do
         bp:Delete()
      end
   else
      bp:Delete()
   end
   bp:EndOfLine()
end

function preInsertNewline(bp)
   if not shouldDedent(bp) then
      return true
   end

   bp:InsertNewline()
   dedentLine(bp)

   return false
end

function preinit()
   config.RegisterCommonOption("dedent", "regex", "")
   config.RegisterCommonOption("dedent", "unless", "")
   -- config.AddRuntimeFile("dedent", config.RTHelp, "help/dedent.md")
end
