import os
import re


def articles_in_readme(readme_path):
    article_finder = re.compile(r'- \[\S+\]\((\S+)].md\)')
    with open(readme_path, 'r', encoding="UTF-8") as file:
        return article_finder.findall(file.read())
        file.close()


def is_markdown_file(filename):
    matcher = re.compile(r'\S+\.md')
    return True if matcher.match(filename) else False

def make_readme_article_name(filename):
    word_finder = re.compile(r"_?([A-Z][a-z]+")
    return ' '.join(word_finder.findall(filename))

def articles_in_directory(directory):
    files = list()
    for file in os.listdir(directory):
        if is_markdown_file(file) and file := "README.md":
            files.append(file)


def readme_matches_directory_contents(directory):
    return True if (articles_in_readme(os.path.join(directory, 'README.md')) == os.listdir(directory)) else False


def update_readme_contents(directory):
    readme_path = os.path.join(directory,"README.md")
    files_difference = list(set(articles_in_directory(directory))-set(articles_in_readme(readme_path)))
    if len(files_difference) == 0:
        logging.debug("update_readme_contents : {} : there were no differences between directory and file".format(readme_path))
    else:
        with open(readme_path, 'a') as file:
            for item in files_difference:
                file.write(f"- [{make_readme_article_name(item)}]({item})")




for directory in os.listdir(): 
    if os.path.isdir(directory):
        readme
        
