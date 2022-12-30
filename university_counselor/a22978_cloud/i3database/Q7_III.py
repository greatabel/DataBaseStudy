import csv
import os
from functools import cmp_to_key
from similarity import calc_jaccard

def read_csv_file(filename: str):
    with open(filename, encoding='utf-8-sig') as infile:
        reader = csv.reader(infile)

        # Read first line of the the CSV file.
        # headers = next(reader)

        # Read remaining rows from the CSV file.
        for row in reader:
            # Strip any leading/trailing white space from data read.
            row = [item.strip() for item in row]
            yield row


def  main():
    '''
    common schema is FullBook(id, title, authors, publish_date, publisher, isbn13, pages)

    '''
    data_path = os.path.abspath('../data/')
    out_path = os.path.abspath('../out/')

    # get id,title from book1
    book1list = []
    for data_row in read_csv_file(os.path.join(data_path, 'Book1.csv')):
        # print(data_row, '#'*5)
        id = data_row[0]
        title = data_row[1]


        book1list.append([id, title])

    print(len(book1list), book1list[0])

    # get id,title from book2
    book2list = []
    for data_row in read_csv_file(os.path.join(data_path, 'Book2.csv')):

        id = data_row[0]
        title = data_row[1]
        book2list.append([id, title])


    print(len(book2list), book2list[0])
    outlist = []
    # for quick sample test
    # book1list = book1list[:200]
    # book2list = book2list[:200]
    
    for book1 in book1list:
        for book2 in book2list:
            b1_b2_similarity = calc_jaccard(book1[1], book2[1], 3)
            if b1_b2_similarity > 0.75:
                print(book1[0], book2[0])
                outlist.append([book1[0], book2[0]])

    print('my linkage:', len(outlist), outlist[0], '#'*10)
    with open(os.path.join(out_path, 'b1_b2_linkage.csv'), "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerows(outlist)
    
    # read external dataset , gold-standard dataset
    goldstandard = []
    for data_row in read_csv_file(os.path.join(data_path, 'Book1and2_pair.csv')):
        # print(data_row, '#'*5)
        id1 = data_row[0]
        id2 = data_row[1]
        goldstandard.append([id1, id2])

    print('goldstanard ', len(goldstandard), goldstandard[0])

    # tp, fp, and fn represent true positive, false positive, and false negative, respectively
    tp = 0
    fp = 0
    fn = 0
    for d in outlist:
        if d in goldstandard:
            tp += 1
        else:
            fp += 1
    for g in goldstandard:
        if g not in outlist:
            fn += 1
    print('tp, fp, fn=', tp, fp, fn)
    precision = tp / (tp + fp)
    recall = tp / (tp + fn)
    f_measure = 2 * precision * recall / (precision + recall)
    print('precision=', precision)
    print('recall=', recall)
    print('f_measure=', f_measure)

if __name__ == "__main__":
    main()

























