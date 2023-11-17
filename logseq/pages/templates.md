- Daily Template
  template:: daily
  template-including-parent:: false
	- ### Agenda
	- ### Intake
- #Meeting
  template:: Meeting
  people::
  collapsed:: true
	- Action items
	- Prep
	- Discussion
- {{query (and (between <% 13 days ago %> now) (task "DONE"))}}
  template:: demo query
  collapsed:: true
- #+BEGIN_QUERY
  {
    :title [:h2 "Project Tasks"]
    :query [
      :find (pull ?b [* {:block/_parent ...}])
      :in $ ?current-page
      :where
        [?p :block/name ?current-page]
        [?b :block/path-refs ?p]
        [?b :block/marker ?marker]
        [(contains? #{"TODO" "DOING" "NOW" "LATER" "WAITING"} ?marker)]]
    :inputs [:current-page]}
  #+END_QUERY
  template:: project tasks
