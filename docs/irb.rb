# .irbrc
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:AUTO_INDENT] = true

IRB.conf[:PROMPT][:CUSTOM] = {
  PROMPT_I: "irb(#{Dir.pwd}) ",
  PROMPT_S: "irb(#{Dir.pwd})* ",
  PROMPT_C: "irb(#{Dir.pwd})? ",
  PROMPT_N: "irb(#{Dir.pwd})* ",
  RETURN: "%s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM

