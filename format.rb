# Formats 精灵五笔 dictionary files.

def dos2unix(str)
  str.delete("\xEF\xBB\xBF".force_encoding("UTF-8"))
     .gsub(/\r\n/, "\n")
end

fname = ARGV.shift
fail "Missing required argument fname." unless fname

Entry = Struct.new(:word, :code)

headers, entry_lines = dos2unix(File.read(fname)).lines(chomp: true)
  .partition{ |line| line.start_with? "---config@" }

entries = entry_lines
  .reject{ |line| line.strip.empty? }
  .map{ |line| Entry.new(*line.split("\t")) }
  .reject{ |entry| entry.code.end_with? "#删" }
  .sort_by.with_index{ |e, i|
    [e.code.end_with?("#固") ? 0 : 1,  # Pinned entries stay on top.
     e.code,
     i,  # Stable sort: break tie by position.
    ]
  }

File.write(fname, [
  *headers,
  *entries.map{ |e| "#{e.word}\t#{e.code}" },
  ""  # New line at EOF.
] * "\n")
