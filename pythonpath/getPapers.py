import os
from os.path import join
from pathlib import Path

import time
import datetime

from urllib.request import urlretrieve
from bs4 import BeautifulSoup
import arxiv
import requests
from tqdm import tqdm


def getAllAcceptedIJCAI18Papers():
    def extractTitleAndAuthors(linkList):
        # list of papers. papers[0] -> {'title', 'authors'}
        papers = [l.contents[0] for l in linkList]
        links = []
        for p in papers:
            a = p.split(',')
            title = a[0]
            authors = a[1:]
            tmp = {'title': title, 'authors': authors}
            links.append(tmp)
        return links

    url = "https://www.ijcai-18.org/accepted-papers/"
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")
    article = soup.findAll('article')[0]
    links = article.findAll('li')
    return extractTitleAndAuthors(links)


def findPapersOnArxiv(paperList, verbose=True):
    if verbose: print('Query arxiv for {} papers'.format(len(paperList)))
    completePapers = []
    t0 = time.time()
    for p in tqdm(paperList):
        try:
            if verbose: print('title {}\ntype: {}'.format(p['title'], type(p)()))
            q = arxiv.query(search_query=p['title'], max_results=1)
            completePapers.append(q[0])
        except:
            print('Error extracting info')
            print('Title: ', p['title'])
    t = int(time.time() - t0)
    print('The process took {} hh:mm:ss'.format(str(datetime.timedelta(seconds=t))))
    return completePapers


def downloadPDF(obj, dirname='./', prepend_id=False, slugify=False):
    # Taken from
    # https://github.com/lukasschwab/arxiv.py/blob/master/arxiv/arxiv.py
    # My First Pull request AMAGAHSDKJADKAÖHDDLhadflkashfddflkjafk ?????
    # Add os.path.join function for robustness.
    # Downloads file in obj (can be result or unique page) if it has a .pdf link
    if 'pdf_url' in obj and 'title' in obj and obj['pdf_url'] and obj['title']:
        filename = obj['title']
        if slugify:
            filename = to_slug(filename)
        if prepend_id:
            filename = obj['arxiv_url'].split('/')[-1] + '-' + filename
        # filename = dirname + filename + '.pdf'
        filename = join(dirname, filename+'.pdf')
        # Download
        urlretrieve(obj['pdf_url'], filename)
        return filename
    else:
        print("Object obj has no PDF URL, or has no title")



def findTitlesAndDownload(titles, filepath='.', verbose=True):
    '''
    :titles     list of titles
    :filepath    path to folder to save pdf
    :verbose    boolean, print out information
    '''
    filepath = os.path.realpath(filepath)
    if not os.path.exists(filepath):
        print('Creating non-existing folder')
        print(filepath)
        Path(filepath).mkdir(parents=True)

    if verbose: print('Query arxiv for {} papers'.format(len(titles)))
    t0 = time.time()
    for t in titles:
        if verbose: print('Title: ', t)
        paper = arxiv.query(search_query=t, max_results=1)[0]  # only fetch one result. returns list.
        title = paper['title'].replace(' ', '-').replace('--','-')
        filename = title + '-' + paper['arxiv_url'].split('/')[-1] + '.pdf'
        filename = join(filepath, filename)
        try:
            urlretrieve(paper['pdf_url'], filename)
        except:
            print('Error downloading paper')
            print('Title: ', t)
            continue
    t = int(time.time() - t0)
    print('The process took {} hh:mm:ss'.format(str(datetime.timedelta(seconds=t))))
    return filepath


def main():
    t0 = time.time()
    paperDir = os.path.abspath('./data/')
    papers = getAllAcceptedIJCAI18Papers()
    papers = papers[:5]
    arxivPapers = findPapersOnArxiv(papers)

    # for p in tqdm(arxivPapers):
    #     downloadPDF(p, dirname=paperDir)
    nPapers = len(papers)
    totalTime = time.time() - t0
    print('This script found {} accepted papers to IJCAI18 in {} hh:mm:ss'.format(nPapers, str(datetime.timedelta(seconds=totalTime))))

    # ---------------------------------------------------
    # IJCAI
    nlp1 = []
    nlp1.append('SentiGAN: Generating Sentimental Texts via Mixture Adversarial Networks')
    nlp1.append('Generating Thematic Chinese Poetry using Conditional Variational Autoencoders with Hybrid Decoders')
    nlp1.append('Chinese Poetry Generation with a Working Memory Model')
    nlp1.append('Topic-to-Essay Generation with Neural Networks')
    nlp1.append('Toward Diverse Text Generation with Inverse Reinforcement Learning')

    NLP_DIA1 = []  # Dialogue, Conversation Models
    NLP_DIA1.append('Get The Point of My Utterance! Learning Towards Effective Responses with Multi-Head Attention Mechanism')
    NLP_DIA1.append('Learning to Converse with Noisy Data: Generation with Calibration')
    NLP_DIA1.append('Smarter Response with Proactive Suggestion: A New Generative Neural Conversation Paradigm')
    NLP_DIA1.append('Commonsense Knowledge Aware Conversation Generation with Graph Attention')
    NLP_DIA1.append('Submodularity-Inspired Data Selection for Goal-Oriented Chatbot Training Based on Sentence Embeddings')
    NLP_DIA1.append('Learning Out-of-Vocabulary Words in Intelligent Personal Agents')
    NLP_DIA1.append('One "Ruler" for All Languages: Multi-Lingual Dialogue Evaluation with Adversarial Multi-Task Learning')

    findTitlesAndDownload(nlp1, filepath='./papers', verbose=True)
    findTitlesAndDownload(NLP_DIA1, filepath='./papers', verbose=True)


if __name__ == '__main__':
    main()
