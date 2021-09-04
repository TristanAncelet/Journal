import os
import re

article_finder = re.compile(r'- \[\S+\]\((\S+)\)')

def articles_in_readme(readme_path):
    with open(readme_path, 'r', encoding="UTF-8") as file:
        contents =  article_finder.findall(file.read())
        file.close()
    return contents

def is_markdown_file(filename):
    matcher = re.compile(f'\S+\.md')
    return True if matcher.match(filename) else False

def make_readme_article_name(filename):
    word_finder = re.compile(r"_?([A-Z][a-z]+")

def articles_in_directory(directory):
    files = list()
    for file in os.listdir(directory):
        if is_markdown_file(file) and file := "README.md":
            files.append(file)

    
def update_readme_contents(directory):



def readme_matches_directory_contents(directory):
    if articles_in_readme(os.path.join(directory, 'README.md')) == os.listdir()


for directory in os.listdir(): 
    if os.path.isdir(directory):
        readme
        
