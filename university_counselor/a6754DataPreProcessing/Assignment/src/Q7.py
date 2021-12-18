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
    field_count = 0
    error_count = 0
    i  = 0
    for data_row in read_csv_file(os.path.join(data_path, 'Book3.csv')):

        r_len = len(data_row)
        field_count += r_len

        for cell in data_row:
            if cell is None or cell == '':
                error_count += 1

    print('field_count=', field_count, 'error_count=', error_count)
    print('error_count / field_count=' , error_count / field_count)


        






if __name__ == "__main__":
    main()

























