defmodule Msync do

	def run do
		IO.puts "opening connection to the db"
		dbid = :d
		Couchie.open(dbid)
		IO.puts "Getting list of files...."
		flist = Path.wildcard("./elixir/*")
		IO.puts "Uploading files:"
		Enum.each flist, upload_file(dbid, &1)
    # Enum.map paths, :unicode.characters_to_binary(&1)


	end

	defp upload_file(dbid, file) do
		IO.puts "Opening file #{file}"
		File.open file
	end

end
