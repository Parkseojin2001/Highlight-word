from langchain.prompts import PromptTemplate, ChatPromptTemplate
from langchain.chat_models import ChatOpenAI
from wordModel import detection_word

# OpenAI 사용
llm = ChatOpenAI(
    temperature=0.1,
)

# 사용자에게 받아야 하는 값
color = "yellow"
lang = "eng"
trans = "Korean"
path = "~~~~~~~"

def create_sentence(color, lang, trans, path):
    
    words = detection_word(color, lang, path)

    template_1 = PromptTemplate.from_template("Create a sentence that can be used in everyday life using {word}.")
    template_2 = PromptTemplate.from_template("Also translate \"{sentence}\" into {language}.")

    dic = {}

    for word in words:
        prompt_1 = template_1.format(word=word)
        sentence = llm.predict(prompt_1)
        prompt_2 = template_2.format(sentence= sentence, language=trans)
        mean = llm.predict(prompt_2)
        dic[sentence] = mean

    return dic


dictionary = create_sentence(color, lang, trans, path)

for key in dictionary.keys():
        print(f"{key}:{dictionary[key]}")
