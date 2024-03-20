import os
import pathlib

from bottle import SimpleTemplate

RELIGIONS = {
	"catholic": "Catholic",
	"protestant": "Protestant",
	"reformed": "Reformed",
	"anglican": "Anglican",
	"orthodox": "Orthodox",
	"coptic": "Coptic",
	"lollard": "Lollard",
	"anabaptist": "Anabaptist",
	"waldensian": "Waldensian",
	"dissenter": "Dissenter",
	"jewish": "Jewish",
	"karaite": "Karaite",
	"samaritan": "Samaritan",
	"sunni": "Sunni",
	"shia": "Shia",
	"ibadi": "Ibadi",
	"buddhist": "Buddhist",
	"vajrayana": "Vajrayana",
	"mahayana": "Mahayana",
	"confucian": "Confucian",
	"shinto": "Shinto",
	"hindu": "Hindu",
	"sikh": "Sikh",
	"animism": "Animist",
	"shamanism": "Shamanist",
	"totemism": "Totemist",
	"inti": "Inti",
	"nahuatl": "Nahuatl",
	"mesoamerican": "Mesoamerican",
	"norse_pagan": "Norse Pagan",
	"baltic_pagan": "Baltic Pagan",
	"tengri_pagan": "Tengri",
	"zoroastrian": "Zoroastrian",
	"dreamtime": "Alcheringa",
}

if __name__ == "__main__":
	
	project_tree = pathlib.Path(__file__).parent.parent.resolve()

	ctx = {
		"religions": RELIGIONS,
	}

	for root, dirs, files in os.walk(project_tree):
		for file in files:
			if file.endswith(".tpl"):
				template_full_path = os.sep.join((root, file))
				outfile = file[:-4]
				outfile_full_path = os.sep.join((root, outfile))
				print("Found template:", template_full_path)
				print("Writing output to:", outfile_full_path)

				template_contents = open(template_full_path).read()
				template = SimpleTemplate(template_contents)
				
				# dont use bom for non-lang files 
				if "_l_" in file: enc = "utf-8-sig"
				else: enc = "utf-8"
				
				with open(outfile_full_path, "w", encoding=enc) as fp:
					fp.write(template.render(**ctx))