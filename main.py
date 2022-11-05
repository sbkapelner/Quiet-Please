from quiet import Top


def main(iterations, sort, num_processes, threshold):
    radio_static = Top(iterations, sort, num_processes, threshold)
    return radio_static.runTop()


if __name__ == "__main__":
    main(iterations=3, sort="cpu", num_processes=5, threshold=3.0)
