module ReportsHelper        
  def parts_of_speech_counts
    # Because some fields will have additional description (indicated by a comma, i.e.
    # '{verb, ending in -ing}'), the description is stripped (when present) and the bare
    # parts of speech are tallied.
    MadLib.all.inject({}) do |counts, mad_lib|
      mad_lib.fields.each do |field|
        # Assume fields are of the form: <part_of_speech>(, <description>)?
        field_pattern = /(?<part_of_speech>[^{,]+)(,\ (?<description>.+))?/
        field_type = field.match(field_pattern)[:part_of_speech].pluralize.capitalize
        counts[field_type] = (counts[field_type] || 0) + 1
      end
      counts
    end
  end

  def solution_word_counts
    # Counts how many times each word (or phrase) is used over every mad_lib_solution
    MadLibSolution.all.inject({}) do |counts, solution|
      solution.fields.values.each do |word|
        counts[word] = (counts[word] || 0) + 1
      end
      counts
    end
  end
end
