defmodule Msync do

	def run do
		#IO.puts "opening connection to the db"
		dbid = :d
		Couchie.open(dbid)
		#IO.puts "Getting list of files...."
		File.cd("./elixir")
		flist = Path.wildcard("*")
		#IO.puts "Uploading files: #{flist}"
		Enum.each flist, upload_file(dbid, &1)
    # Enum.map paths, :unicode.characters_to_binary(&1)


	end

	defp upload_file(dbid, path) do
		#IO.puts "Opening file #{path}"
		{:ok, binary} = File.read path
		#IO.puts "Got #{binary} \n\n*****\n\n"
		dict = HashDict.new [{:code, binary}]
		#IO.puts "Storing #{path} to database"
		Couchie.set(dbid, path, dict)
	end

end
