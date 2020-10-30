import csv
import os
from functools import cmp_to_key


def read_csv_file(filename: str):
    with open(filename, encoding='utf-8-sig') as infile:
        reader = csv.reader(infile)

        # Read first line of the the CSV file.
        headers = next(reader)

        # Read remaining rows from the CSV file.
        for row in reader:
            # Strip any leading/trailing white space from data read.
            row = [item.strip() for item in row]
            yield row

def compare(item1, item2):
    # sort by isbn15, whichi  this 5th index
    if int(item1[5]) < int(item2[5]):
        return -1
    elif int(item1[5]) > int(item2[5]):
        return 1
    else:
        return 0

#  to merge and sort two list 
def merge(list1, list2): 
    final_list = list1 + list2 
    final_list = sorted(final_list, key=cmp_to_key(compare))

    return(final_list) 

def  main():
    '''
    common schema is FullBook(id, title, authors, publish_date, publisher, isbn13, pages)
    First find common part in Book3
    then find common part in Book4

    '''
    data_path = os.path.abspath('../data/')
    out_path = os.path.abspath('../out/')
    book3list = []
    for data_row in read_csv_file(os.path.join(data_path, 'Book3.csv')):
        # print(data_row, '#'*5)
        id = data_row[0]
        title = data_row[1]
        authors = [data_row[2], data_row[3] ,data_row[4]]
        publish_date = data_row[7]
        publisher = data_row[5]
        isbn13 = data_row[6]
        pages = data_row[8]

        book3list.append([id, title, authors, publish_date, publisher, isbn13, pages])

    print(len(book3list), book3list[0])

    book4list = []
    for data_row in read_csv_file(os.path.join(data_path, 'Book4.csv')):
        # print(data_row, '#'*5)
        id = data_row[0]
        title = data_row[1]
        authors = data_row[4]
        publish_date = data_row[8]
        publisher = data_row[7]
        isbn13 = data_row[6]
        pages = data_row[9]

        book4list.append([id, title, authors, publish_date, publisher, isbn13, pages])
    print(len(book4list), book4list[0])

    fullbooklist = merge(book3list, book4list)
    print(len(fullbooklist), fullbooklist[1], '#'*10)
    with open(os.path.join(out_path, 'FullBookList.csv'), "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerows(fullbooklist)
    


if __name__ == "__main__":
    main()