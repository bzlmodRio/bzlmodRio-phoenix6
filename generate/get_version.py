from get_phoenix6_dependencies import get_phoenix6_dependencies


def main():
    group = get_phoenix6_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
